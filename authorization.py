# source: https://www.youtube.com/watch?v=WAmEZBEeNmg&ab_channel=Linode
from dotenv import load_dotenv
import os
import base64
from requests import post, get
import json

load_dotenv()

client_id = "76af978f82c3430bb2fe9661b6147767"
client_secret = "aa3b6d552ada418bbdbc6b4b9105126a"

def get_token():
  auth_string = client_id + ":" + client_secret
  auth_bytes = auth_string.encode("utf-8")
  auth_base64 = str(base64.b64encode(auth_bytes), "utf-8")

  url = "https://accounts.spotify.com/api/token"
  headers = {
    "Authorization": "Basic " + auth_base64,
    "Content-Type": "application/x-www-form-urlencoded"
  }
  data = {"grant_type": "client_credentials"}
  result = post(url, headers=headers, data=data)
  json_result = json.loads(result.content) # dictionary type
  token = json_result["access_token"]
  return token # string type

def get_auth_header(token):
  return {"Authorization": "Bearer " + token}

def search_for_artist(token, artist_name):
  url = "https://api.spotify.com/v1/search"
  headers = get_auth_header(token)
  query = f"?q={artist_name}&type=artist&limit=1"

  query_url = url + query
  result = get(query_url, headers=headers)
  json_result = json.loads(result.content)["artists"]["items"]
  if len(json_result) == 0:
    return None
  return json_result[0]

def handle_artist():
  with open('data/user_input.txt') as f:
    artist = f.readlines() # returns a list
  # grabs the firts (and only) string in the list and removes the trailing newline character
  artist = artist[0].strip()
  token = get_token()
  result = search_for_artist(token, artist)
  with open("data/artist.json", "w") as f:
    json.dump(result, f)
  return