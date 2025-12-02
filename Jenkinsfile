pipeline {
    agent any
    
    tools {
        maven 'M3'  // Ajusta este nombre a tu instalación de Maven
    }
    
    environment {
        // Variables útiles
        DOCKER_BUILDKIT = '0'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Get source code from repository'
                checkout scm
                
                // Diagnóstico: ver estructura del proyecto
                sh 'ls -la'
                sh 'pwd'
            }
        }
        
        stage('Check Tools') {
            steps {
                echo 'Verifying tools availability'
                sh 'mvn --version || echo "Maven not found"'
                sh 'docker --version || echo "Docker not found"'
                sh 'docker-compose --version || docker compose version || echo "Docker Compose not found"'
            }
        }
        
        stage('Compile') {
            steps {
                echo 'Compile the project'
                sh 'mvn clean compile -B'  // -B para modo batch
            }
        }
        
        stage('Test') {
            steps {
                echo 'Test the project'
                sh 'mvn test -B'
            }
        }
        
        stage('Package') {
            steps {
                echo 'Package the project'
                sh 'mvn package -DskipTests -B'
                
                // Verificar que se creó el JAR
                sh 'ls -la target/*.jar || echo "No JAR found"'
            }
        }
        
        stage('Docker build') {
            steps {
                echo 'Build Docker image'
                script {
                    // Verificar que existe Dockerfile
                    sh 'test -f Dockerfile && echo "Dockerfile found" || echo "Dockerfile NOT found"'
                    
                    // Construir con permisos explícitos
                    sh '''
                        docker build --no-cache -t user-service-jgm:1.0 . 2>&1 | tail -20
                    '''
                }
            }
        }
        
        stage('Docker Compose Restart') {
            steps {
                echo 'Restarting user services'
                script {
                    // Verificar que existe docker-compose.yml
                    sh 'test -f docker-compose.yml && echo "docker-compose.yml found" || ls docker-compose* 2>/dev/null || echo "No docker-compose file"'
                    
                    // Usar docker-compose o docker compose según versión
                    sh '''
                        # Intentar con docker-compose (v1) o docker compose (v2)
                        docker-compose --version 2>/dev/null && \
                        docker-compose up -d postgres-user-dev user-service-dev || \
                        docker compose up -d postgres-user-dev user-service-dev
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo 'Build completed successfully!'
            // Mostrar información útil
            sh 'docker images | grep user-service'
            sh 'docker ps | grep user-service'
        }
        failure {
            echo 'Build failed. Please check the logs.'
            // Logs adicionales en caso de fallo
            sh 'docker images || true'
            sh 'docker ps -a || true'
        }
        always {
            // Limpieza opcional
            echo 'Cleaning workspace...'
            cleanWs()
        }
    }
}
