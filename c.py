
import requests
import json
import datetime
import os
def tts(msg):
    cmd = f'spd-say -l es -y "Spanish (Spain)+female2" "{msg}"'
    os.system(cmd)
def callback(d: dict):
    if d.get("event") == "message":
        title = d.get("title")
        message = d.get("message")
        tags = d.get("tags")
        time =  d.get("time")
        time2= str(datetime.datetime.fromtimestamp(time))
        if title != "clear_notification":
            tts(message)
    print(d)
def main(topic):
    resp = requests.get(f"https://ntfy.sh/{topic}/json", stream=True)
    for line in resp.iter_lines():
        if line:
            callback(json.loads(line))

if __name__ == "__main__":
    main(input("Topic, please!\nntfy.sh topic: \n> "))