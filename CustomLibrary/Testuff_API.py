import requests

class testuffapi:
 def post_file(self,runId,token,geturl,path):
  url = geturl+"/runfile/"+runId+"/"
  files = {"file": open(path,"rb")}
  head = {
   "Authorization" : token
	}
  r=requests.post(url , files=files , headers=head)
  print(r.status_code)
  return(runId,token,path)

obj = testuffapi()
