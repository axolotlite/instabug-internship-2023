# Wow Such Program

This program is very simple, it connects to a MySQL database based on the following env vars:
* MYSQL_HOST
* MYSQL_USER
* MYSQL_PASS
* MYSQL_PORT

And exposes itself on port 9090:
* On `/healthcheck` it returns an OK message, 
* On GET it returns all recorded rows.
* On POST it creates a new row.
* On PATCH it updates the creation date of the row with the same ID as the one specified in query parameter `id`

Check this golang project in the attachment and create the following:
- [ ] Dockerfile that build the app and try to make it as lightweight as you can.
- [ ] Pipeline job (jenkinsfile) to build the app using dockerfile and
- [ ] reports if any errors happened in the build. The output of the build step should be a docker image pushed to dockerhub or any docker repo you want.
- [ ] Docker compose file that contains both application and mysql database so you can run the app locally.
- [ ] Helm manifests for kubernetes to deploy the app using them on
- [ ] kubernetes with adding config to support high availability and volume persistence and exposing service to the public (you can use minikube to test).


## Bonus:
- [ ] Add autoscaling manifest for number of replicas.
- [ ] Add argocd app that points to helm manifests to apply gitops concept.
- [ ] Secure your containers as much as you can.
- [x] Fix a bug in the code that would appear when you test the api (all needed information of api is in the readme file)
	exported the elements of the struct row
	![modified struct](images/image_1.png)