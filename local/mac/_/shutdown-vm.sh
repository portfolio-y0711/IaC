ssh -tt root@jenkins shutdown -h now
sleep 1
ssh -tt root@gitlab shutdown -h now
sleep 1
ssh -tt root@agent shutdown -h now
sleep 1
ssh -tt root@docker-registry shutdown -h now
sleep 1

