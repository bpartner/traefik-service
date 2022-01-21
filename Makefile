up: traefik-up n8n-up monitor-up jenkins-up
down: traefik-down n8n-down monitor-down jenkins-down
restart: down up

traefik-up: docker-traefik-up
traefik-down: docker-traefik-down
traefik-restart: traefik-down traefik-up

n8n-up: docker-n8n-up
n8n-down: docker-n8n-down
n8n-restart: n8n-down n8n-up

monitor-up: docker-monitor-up
monitor-down: docker-monitor-down
monitor-restart: monitor-down monitor-up

jenkins-up: docker-jenkins-up
jenkins-down: docker-jenkins-down
jenkins-restart: jenkins-down jenkins-up



docker-traefik-up:
	docker-compose up -d
docker-traefik-down:
	docker-compose down
docker-n8n-up:
	docker-compose -f docker-compose.n8n.yml up -d --force-recreate
docker-n8n-down:
	docker-compose -f docker-compose.n8n.yml down
docker-monitor-up:
	docker-compose -f docker-compose.portainer.yml up -d --force-recreate
docker-monitor-down:
	docker-compose -f docker-compose.portainer.yml down
docker-jenkins-up:
	docker-compose -f docker-compose.jenkins.yml up -d --force-recreate
docker-jenkins-down:
	docker-compose -f docker-compose.jenkins.yml down
	
