FROM devopsedu/webapp 
ADD certFinal /var/www/html
RUN rm /var/www/html/index.html
CMD apachectl -D FOREGROUND

