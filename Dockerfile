#use python imange because its a python app
FROM python:3.9-slim

#set working directry 
WORKDIR /app

#copy file to the woking directry 
COPY . . 

#install dependency here its requirement.txt 
RUN pip install -r requirements.txt

#expose port as per the application 
EXPOSE 5000

#run the app
CMD [ "python","app.py" ]
