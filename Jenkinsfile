node{
	def docker=tool name: 'docker', type: 'dockerTool'
        def dockerCMD = "${docker}/bin/docker"
    stage('git checkout'){
        git credentialsId: 'gitPwd', url: 'https://github.com/varous7/docker-handson.git'
    }
    stage('code build and test'){
        def mvnHome = tool name: 'maven-3' ,type: 'maven'
        def mvnCMD = "${mvnHome}/bin/mvn"
        sh "${mvnCMD} clean package"
    }
    stage('docker build'){
        
        sh "sudo ${dockerCMD} version"
        sh "sudo ${dockerCMD} build -t varous/devop2:1.0 ."
    }
    stage('docker push'){
    	withCredentials([string(credentialsId: 'dckPwd', variable: 'dckrPwd')]) {
    // some block
    		sh "sudo ${dockerCMD} login -u varous -p ${dckrPwd}"
	    }
	    sh "sudo ${dockerCMD} push varous/devop2:1.0"
    }
    // stage('docker run'){
    // 	withCredentials([string(credentialsId: 'dckPwd', variable: 'dckrPwd')]) {
    // // some block
    // 		sh "sudo ${dockerCMD} login -u varous -p ${dckrPwd}"
	   // }
	   // //sh "sudo ${dockerCMD} run -p 9090:8080 -d varous/devop2:1.0"
    // }
    stage('pcf push'){
        pushToCloudFoundry cloudSpace: 'development', credentialsId: 'pcfPwd', organization: 'sourav-devopsdemo', selfSigned: 'false', target: 'https://api.run.pivotal.io'
    }
}
