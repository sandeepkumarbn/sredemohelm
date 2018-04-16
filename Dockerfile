FROM centos:7
LABEL maintainer="sreact@synchronoss.com"
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx
ADD index.html /usr/share/nginx/html/index.html
ADD K8S.jpg /usr/share/nginx/html/K8S.jpg
ADD plus.gif /usr/share/nginx/html/plus.gif
ADD download.jpg /usr/share/nginx/html/download.jpg
EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]
