pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
              git branch: 'main', url: 'https://github.com/kvnikhildev/python-app-1.git'
            }
        }
        stage('Build') {
            steps {
                script{
                    sh 'docker build -t python-app-1 .'
                }
              
            }
        }
        stage('deploy') {
            steps {
                script{
                   sh  'docker run -p 5000:5000 python-app-1'
                }
              
            }
        }

    }

}