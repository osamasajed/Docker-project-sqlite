node {
    stage('build') {
        sh 'docker build -t muhammadosama/sqlite-project:jenkins-local .'
    }
    stage('deploy') {
        withCredentials([string(credentialsId: 'DOCKERHUB_USER', variable: 'DOCKERHUB_USER'), string(credentialsId: 'DOCKERHUB_PASS', variable: 'DOCKERHUB_PASS')]) {
            sh "docker login -u $env.DOCKERHUB_USER -p $env.DOCKERHUB_PASS"
            sh "docker push $env.DOCKERHUB_USER/sqlite-project:jenkins-local"
        }
    }
}
