node {
    def app

    stage('Clone repository - CLONADO') {
        checkout scm
    }
    stage('Compilar paquete GIT'){
            sh 'mvn -f pom.xml clean install'
    }

    stage('Copiar paquete a GIT'){ // Copiamos el JAR a la ruta donde lo puede coger la imagen
            sh "cp  /var/jenkins_home/workspace/testIPS/target/*.jar  /var/jenkins_home/workspace/testIPS/"
    }

    stage('Build image - CONSTRUCCION ') {
         app = docker.build("engisoftecstests/test") // Nombre imagen
    }

    stage('Push image - SUBIR') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}") // Subimos con nombre de version
            app.push("latest") // Subimos con nombre latest
        }
    }
}