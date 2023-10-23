import json

def format_data(data):
    keys_to_keep = ["counters"]

    # Filter Json file keys to get all the counters
    keys_to_keep = ["counters"]
    filtered_data = {key: data[key] for key in keys_to_keep if key in data}

    # Length and all timepoints 
    if (filtered_data['counters'][0]['sampleGroups'][0]['samples']['length'] < filtered_data['counters'][2]['sampleGroups'][0]['samples']['length']) :
        length = filtered_data['counters'][0]['sampleGroups'][0]['samples']['length']
    else : length = filtered_data['counters'][2]['sampleGroups'][0]['samples']['length']

    time = filtered_data['counters'][0]['sampleGroups'][0]['samples']['time']

    cpu_usage_processes = []
    power_usage_processes = []

    for i in range(4):
        # CPU utilization values per process
        if (filtered_data['counters'][i]['description'] == 'Process CPU utilization') :
            cpu_usage_processes.append(filtered_data['counters'][i]['sampleGroups'][0]['samples']['count'])
        # Power utilization values per process
        else :
            power_usage_processes.append(filtered_data['counters'][i]['sampleGroups'][0]['samples']['count'])

    cpu_usage = []
    power_usage = []

    for i in range(length):
        cpu_sum = 0
        power_sum = 0
        for j in range(len(cpu_usage_processes)):
            cpu_sum += cpu_usage_processes[j][i]
            power_sum += power_usage_processes[j][i]
        cpu_usage.append(cpu_sum)
        power_usage.append(power_sum)

    return {
        "time" : time,
        "power usage" : power_usage,
        "cpu usage": cpu_usage
    }

# change machine and llm
machine = 'm1'
llm = ['bard','chatgpt','llama']
tasks = ['generation','knowledge','realworld']

for l in llm:
    for t in tasks:
        file_name = machine + '-' + t + '-' + l + '.json'
        directory = l + '/' + file_name
        with open(directory, 'r') as json_file:
            data = json.load(json_file)

        output = format_data(data)

        new_file_name = machine + '-' + t + '-' + l + '-formated.json'
        new_directory = l + '/' + new_file_name
        with open(new_directory, 'w') as output_file:
            json.dump(output, output_file, indent=4)

        print(new_file_name + ' has been created')
