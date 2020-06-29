pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {

        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('git clone') {
            steps {
                sh 'sudo rm -r *;sudo git clone https://github.com/ukrishna17/terraform.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo terraform init ./terraform'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'sudo terraform plan ./terraform'
             }
        }
        
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
