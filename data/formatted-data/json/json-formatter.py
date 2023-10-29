import json

def format_data(data):
    keys_to_keep = ["counters"]

    # Filter Json file keys to get all the counters
    keys_to_keep = ["counters"]
    filtered_data = {key: data[key] for key in keys_to_keep if key in data}

    # Length and all timepoints
    highest_i = 0
    length = filtered_data['counters'][0]['sampleGroups'][0]['samples']['length']

    for i in range (1,len(filtered_data['counters'])):
        if (filtered_data['counters'][highest_i]['sampleGroups'][0]['samples']['length'] > filtered_data['counters'][i]['sampleGroups'][0]['samples']['length']) :
            length = filtered_data['counters'][i]['sampleGroups'][0]['samples']['length']
            highest_i = i
    
    # time = filtered_data['counters'][0]['sampleGroups'][0]['samples']['time']

    cpu_usage_processes = []
    power_usage_processes = []

    for i in range(len(filtered_data['counters'])):
        # CPU utilization values per process
        if (filtered_data['counters'][i]['category'] == 'CPU') :
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
        # "time" : time,
        "power usage" : power_usage,
        "cpu usage": cpu_usage
    }

# change machine and llsm
machine = 'm1'
llm = ['bard','chatgpt','llama']
tasks = ['generation','knowledge','realworld']

for l in llm:
    for t in tasks:
        file_name = machine + '-' + t + '-' + l + '.json'
        directory = machine + '/' + file_name
        with open(directory, 'r') as json_file:
            data = json.load(json_file)

        output = format_data(data)

        new_file_name = machine + '-' + t + '-' + l + '-formated.json'
        new_directory = machine + '/' + new_file_name
        with open(new_directory, 'w') as output_file:
            json.dump(output, output_file, indent=4)

        print(new_file_name + ' has been created')
