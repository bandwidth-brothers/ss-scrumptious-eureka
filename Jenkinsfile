
pipeline{
	agent any

      tools
      {
                maven 'maven'
                jdk 'java'
      }

	stages{

		stage('Package'){
			steps{
				sh 'mvn clean package -Dmaven.test.skip'
			}
		}

		stage('Deploy'){
			steps{
				sh "docker build -t eureka-service-john ."
				script{
					docker.withRegistry("https://419106922284.dkr.ecr.us-east-2.amazonaws.com/","ecr:us-east-2:ecr_credentials"){
						docker.image("eureka-service-john").push()
					}
				}
				sh "docker system prune -fa"
			}
		}
	}
}
