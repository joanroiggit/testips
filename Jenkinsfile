node {
    def app

    stage('Clone repository - CLONADO') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
    stage('Compilar paquete GIT'){
            
            sh 'mvn -f pom.xml clean install'
           
    }

  /*  stage('Subir paquete a GIT'){
                    sh '''
                        npm --no-git-tag-version version minor
                        git config --global user.name "joanroiggit"
                        git config --global user.email j.roig@engisoft.com
                        git commit -am 'Bumped version number [ci skip]'
                        git push origin master
                     '''

    }
*/

    stage('Build image - CONSTRUCCION ') {
        /* This builds the actual image; synonymous to docker build on the command line */
        app = docker.build("engisoftecstests/test")
    }

    stage('Test image - PRUEBA ') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image - SUBIR') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}") /*Subimos con nombre de version*/
            app.push("latest") /*Subimos con nombre latest*/
        
        }
    
    }
    /*stage('Resultado final'){
        node {
            try {
                sh 'exit 1'
                    currentBuild.result = 'SUCCESS'
            } catch (any) {
                    currentBuild.result = 'FAILURE'
                throw any //rethrow exception to prevent the build from proceeding
            } finally {
                step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: 'j.roig@engisoft.com', sendToIndividuals: true])
            }   
        }  
    }*/
}