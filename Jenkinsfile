pipeline{
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    stages{
        stage('CleanWorkspace') {
            steps {
                cleanWs()
            }
        }
        stage("git checkout"){
            steps{
                git branch: 'master', url: 'https://github.com/rcastelani/aws-lab-tf.git'
                sh 'pwd '
            }
        }
        stage('Init Terraform'){
            steps{
                sh label: '', script: 'terraform init'
            }
        }  
        stage('validate Terraform'){
            steps{
                sh label: '', script: 'terraform validate'
            }
        }
        stage('apply Terraform'){
            steps{
                sh label: '', script: 'terraform apply --auto-approve'
            }
        }
    }
}
