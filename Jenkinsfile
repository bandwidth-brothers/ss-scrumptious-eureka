pipeline{
	agent any
	environment{
		AWS_ID = credentials('aws-id')
		AWS_REGION = credentials('aws-region')
	}
	stages{
		stage('Checkout'){
			steps{
				checkout scm
				sh "chmod +x ./mvnw"
			}
		}
		stage('Analysis'){
			environment{
				SONARQUBE_TOKEN = credentials('sonarqube')
			}
			steps{
				sh "./mvnw clean verify sonar:sonar \\\n" +
					"  -Dsonar.host.url=http://sonarqube:9000 \\\n" +
					"  -Dsonar.login=${SONARQUBE_TOKEN}"
			}
		}
		stage('Build'){
			steps{
				sh './mvnw clean package'
			}
		}
		stage('Publish'){
			steps{
				withAWS(region: 'us-east-2', credentials: 'aws-creds'){
					s3Upload(bucket: 'ss-scrumptious-artifacts', file: 'target/eureka_service-0.0.1-SNAPSHOT.jar', path: 'restaurant-eureka.jar')
				}
			}
		}
		stage('Deploy'){
			steps{
				sh "docker build -t ss-eureka:${GIT_COMMIT[0..7]} -t ss-eureka:latest ."
				script{
					docker.withRegistry("https://${AWS_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/","ecr:${AWS_REGION}:aws-creds"){
						docker.image("ss-eureka:${GIT_COMMIT[0..7]}").push()
						docker.image("ss-eureka:latest").push()
					}
				}
				sh "docker system prune -fa"
			}
		}
	}
}
