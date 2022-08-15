import requests


def get_example():
    resp = requests.get("https://www.example.com/")
    return resp.text
