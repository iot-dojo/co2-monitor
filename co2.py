#import subprocess
#out = subprocess.check_output(['sudo', 'python3', '-m', 'mh_z19'])
import mh_z19
#import json
out = mh_z19.read()
#json_str = json.dumps(out)
#print(json_str)
#print(out)
print(out['co2'])
