# kvs-py-redis
Collection of scripts to install/reinstall Docker and project dependencies. To be expanded to a prototype for Key Value Stores aiming to provide a template for Regional P2P networking config updating.  

![container-layout](https://hackernoon.com/hn-images/1*Xxtakmb4YQjiFWFEx4kzQw.png)  

## Notes on Images
* include necessary context only via .dockerignore  
* avoid unnecessary packages consuming extra disk space  
* use docker cache for context that changes frequently in Dockerfile  
* remember data in persistent volumes because next container will use that data  
* use environment variables e.g. RUN, EXPOSE, VOLUME for flexible Dockerfile

## Port Forwarding
These containers are meant to run on remote Fedora servers. My tactic is using vscode extension Remote-SSH and in the new window on sidebar is the Port Forward option. Enter your port number e.g. 8080 and it should show in the browser as localhost:8080.
