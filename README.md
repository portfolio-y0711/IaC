## Infrastructure as Code 프로젝트

부제: 배포 자동화 클러스터 + 쿠버네티스 클러스터를 코드화 하기

<br/>

> 마이크로서비스와 도메인 주도 개발을 공부하며 쿠버네티스 클러스터 서버와 배포 자동화   
> 서버를 구축하였습니다. 번거로운 재설치와 마이그레이션에 과정을 대비해 구축 당시에   
> 짤막하게 메모해둔 것들을 모아 **_코드로서의 인프라스트럭처** 를 만들어 나가기 위한   
> 작업 목록을 만들고 ansible과 같은  ansible 등과 같은 provisiong tools 로 시간이   
> 날 때마다 업데이트를 해나가려고 합니다. 

<!-- <img src="./book.jpg" width="234" height="300"> -->

<br/>

목차 

* 문서화 원칙 

* 클러스터 구성요소

  * 로컬 개발환경 클러스터 

  * 리모트 서버 배포환경 클러스터 

* 향후 과제들 

  * 로컬 개발환경 클러스터

  * 리모트 서버 배포환경 클러스터 

* 회고 

<br/>

### 1. 작성 원칙 

<details open>
<summary>...(닫기)</summary>

<br/>

⚠️ **_주의 사항_** : 

* __provisioning automation__: 본 문서를 작성하는 최종 목적은 설치 과정을 기술한 문서와 수동 작업을 대체할 수 있는 **_코드로서의 인프라 설정 ( Infrastructure of Code)_** 을 만들어 나가기 위해서 입니다. 따라서 자동화 작업이 끝난 항목은 코드로서 존재하고 그렇지 않은 항목은 자동화 작업이나 코드화할 작업과 설정들을 정리하는 할일 목록이 됩니다. 

* __updatable document__: 변경이 있을 때마다 미루지 않고 쉽게 갱신 가능한 형태를 유지할 수 있도록 디테일 보다는 **_문서의 구조_** 에 신경쓰며, 문장보다는 **_키워드_** 위주로 최대한 간결하게 표현합니다. 

* __convention over configuration__: 인지 과부하를 막고 중요한 결정의 수를 최대한 줄여 나가기 위해 꼭 필요한 설정이 아니면 **_권장 설정_** 을 따르고, 기타 기본 설정은 따로 문서화에 포함시키지 않습니다. 

* __regist the urge to over-document__: 문서화의 목적은 **_완벽한 문서화_** 또는  **_튜터리얼_** 을 작성에 있지 않습니다. 스크립트 자동화에 시간이 걸리거나 복잡한 작업은 좋은 설명글이나 동영상을 찾아 이에 대한 링크로 문서화를 대체해 나가고 

<br/>

</details>

### 2. 구성 요소

<!-- #region 2 -->

<details open>
<summary>...(닫기)</summary>

<br/>


🎃 **_로컬 개발환경 클러스터 구성요소 (mac)_**

* _mac os settings_

  <details open>
  <summary>...(닫기)</summary>

  * _lanchd (**_service management_**)_

    * [~/Library/LaunchAgents/local.devpipeline.plist](./local/mac/_/Library/LaunchAgents/local.devpipeline.plist)

  * _applescript (**_automation script_**)_

    * [~/Library/Scripts/start-vm.scpt](./local/mac/_/Library/Scripts/start-vm.scpt)

    * [~/Library/Scripts/shutdown-vm.scpt](./local/mac/_/Library/Scripts/shutdown-vm.scpt)

  * _shellscript (**_execution script_**)_

    * [~/start-vm.scpt](./local/mac/_/start-vm.sh)

    * [./~shutdown-vm.scpt](./local/mac/_/shutdown-vm.sh)

  <br/>

  </details>

* _gitlab/ jenkins-host / jenkins-agent / dockerhub (on virtualbox)_

  <details open>
  <summary>...(닫기)</summary>

  * _네트워크 설정_

    * [/etc/hosts](./local/scripts/etc/hosts)

    ```bash

    # jenkins: Adapter1 - Nat Network, Adapter2 - Host-Only

    # gitlab: Adapter1 - Nat Network, Adapter2 - Host-Only

    # jenkins-agent: Adapter1 - Nat Network, Adapter2 - Host-Only

    # docker-registry: Adapter1 - Bridged Adapter, Adapter2 - Host-Only

    ```

  * _gitlab (**_source code management_**)_

  * _jenkins host (**_build, testing, deploying_**)_

    * [installed plugin list](./local/mac/pluginlist.txt)

  * _jenkins agent (**_worker_**)_

  * _dockerhub (**_container repository_**)_

    * [docker-compose](./local/docker-registry/docker-compose.yaml)

    * [opensslkey.sh](./local/docker-registry/etc/netplan/opensslkey.sh)

  * _kubectl (**_CLI toos for managing kubernetes cluster_**)_

    * [_kube/config](./local/config/_kube/config)

  </details>

<br/>

🎃 **_리모트 서버 배포환경 클러스터 구성요소 (windows 10)_**

* [_windows os settings_](./remote/windows.md)

  <details open>
  <summary>...(닫기)</summary>

  * _command shell 관련 설정 (**_shell_**)_

  * _자동화 스크립트 (**_batch scripts_**)_

  <br/>

  </details>

* [_kubernetes cluser (on virtualbox)_](./remote/kubernetes.md)

  <details open>
  <summary>...(닫기)</summary>

  * network 기본 설정 (**_configuration tools for kubernetes cluster_**)

  * _kubeadm (**_configuration tools for kubernetes cluster_**)_

      * [스크립트](https://github.com/justmeandopensource/kubernetes/blob/master/docs/install-cluster-ubuntu-20.md)
      * [동영상](https://www.youtube.com/watch?v=mMmxMoprxiY&t=454s)

  </details>

  <br/>

</details>

<br/>

<!-- #endregion 1 -->

### 3. 향후 과제들 

<!-- #region 2 -->

<details open>
<summary>...(전체닫기)</summary>

#### 로컬 개발환경 클러스터

<br/>

  ⚡️ **_jenkins_** : 

  <details open>
  <summary>...(닫기)</summary>

  * 플러그인 설치과정을 스크립트로 대체하기
  
  * 또는 백업 플러그인 사용해보기 

  </details>

<br/>

  ⚡️ **_dockerhub_** : 

  <details open>
  <summary>...(닫기)</summary>

  * 쿠버네티스 클러스터가 접근할 수 있도록 프록시 서버 설정하기 

  * 또는 쿠버네티스 클러스터로 옮기고 jenkins 서버가 접근 가능하도록 설정하기 

  * 또는 도커허브 서비스 사용하기 

  </details>

<br/>

#### 리모트 서버배포 클러스터

<br/>

  ⚡️ **_virtualbox_** : 

  <details>
  <summary>...(전체닫기)</summary>

  * 가상화 인스턴스 구성을 자동화 스크립트로 변환하기 

  * 또는 ansible로 가상화 인스턴스 구성하기

  </details>

<br/>

  ⚡️ **_kubernetes_** : 

  <details>
  <summary>...(닫기)</summary>

  * kubeadm 인증서 관리 배포에 대해 알아보기   

  * kubeadm 설정 변경 방법에 대해 알아보기 

  </details>

<br/>

</details>

<br/>

<!-- #endregion 2 -->

### 3. 회고

<!-- #region 3 -->

<details>
<summary>...(전체닫기)</summary>

Kubernetes cluster (remote PC) <-|| -> Jenkins CI/CD cluster (virtual vm's in Local PC) <-> Notebook (Local PC)

* Kubernetes cluster (Remote PC)

``` 
# Server (HP Z800)

  Os: Windows 10
  hostname: server
  Spec: 
    CPU: 12 core 24 thread * 2
    RAM: 
    HDD: 

  Virtual Vm's
    1) 
      Os: Ubuntu 20.04 
      hostname: Kubem
      role: kubernetes controller
      spec: 4 Core
          
    2) 
      Os: Ubuntu 20.04
      hostname: Kuben1
      role: kubernetes worker
      spec: 1 Core

    ...

    18)
      Os: Ubuntu 20.04
      hostname: Kuben18
      role: kubernetes worker
      spec: 1 Core
```

* Developing PC (15inch, Macbook Pro 2015 mid)

Jekins CI/CD cluster (Local PC)

```
1) Local PC Os: MacOs Sierra
2) Virtual Vm
	- Ubuntu 20.04 : Kubem
	- Ubuntu 20.04 : Kuben1
		...
	- Ubuntu 20.04 : Kuben18
```

5. jenkins
  5-0. location
    /usr/local/Cellar/tomcat@8/8.5.59/libexec/webapps/jenkins.war
    /Users/yoonsung0711/.jenkins

  5-1. install
    https://www.jenkins.io/download/
    curl https://get.jenkins.io/war/2.265/jenkins.war

  5-2. configure

6. jenkins-agent
  6-0. location
    /etc/systemd/system

  6-1. install
	/etc/systemd/system$ sudo systemctl daemon-reload
	/etc/systemd/system$ sudo systemctl enable jenkins-agent.service
	/etc/systemd/system$ sudo systemctl start jenkins-agent
	/etc/systemd/system$ sudo systemctl status jenkins-agent

9. virtual box
  9-0. location
    /Users/yoonsung0711/VirtualBox\ VMs/

  9-1. install
    https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-OSX.dmg

  9-2. configure
    (Enabling Host-Only Adapter for VirtualBox 5.1.X and 5.2.X on Mac OS X)
    https://luppeng.wordpress.com/2017/07/17/enabling-virtualbox-host-only-adapter-on-mac-os-x/

    https://technote.kr/213

10. kubernetes cluster with three ubuntu 20.04's on virtual box
  10-0. location

  10-1. install 
    https://releases.ubuntu.com/20.04/ubuntu-20.04.1-live-server-amd64.iso

  10-2. configure
    (Install Kubernetes Cluster using kubeadm)
      https://github.com/justmeandopensource/kubernetes/blob/master/docs/install-cluster-ubuntu-20.md
      https://www.youtube.com/watch?v=mMmxMoprxiY&t=454s

    (/etc/hostname)
      kube-master
      kube-node1
      kube-node2

    (/etc/hosts)
      192.168.56.101 kube-master
      192.168.56.102 kube-node1
      192.168.56.103 kube-node2

11. sshd
  11-1. location
    ~/Users/yoonsung0711/.ssh
    ~/Users/yoonsung0711/.ssh/known_hosts
  11-2. configure
    (Catalina)
      Go to System Preferences -> Sharing, enable Remote Login.

    (/etc/hosts)
      192.168.56.101 kube-master
      192.168.56.102 kube-node1
      192.168.56.103 kube-node2

    (ssh-copy-id)
      ssh-copy-id yoonsung0711@kube-master
      ssh-copy-id yoonsung0711@kube-node1
      ssh-copy-id yoonsung0711@kube-node2

12. vim
  12-1. location
    ~/.vimrc
  12-2. configure
    set expandtab
    set smarttab
    set shiftwidth=2
    set tabstop=2

</details>

<!-- #endregion 4 -->

