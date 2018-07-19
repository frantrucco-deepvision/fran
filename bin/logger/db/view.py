import os
import re


def from_camel_to_spaced(string):
    return re.sub(r"(\w)([A-Z])", r"\1 \2", string)


if __name__ == '__main__':
    print('* Logs')
    print('')
    for filename in os.listdir(os.getcwd()):
        if filename.endswith('.py'):
            continue
        if filename.startswith('.'):
            continue

        print("** " + from_camel_to_spaced(filename))
        with open(filename, 'r') as f:
            print(f.read())

