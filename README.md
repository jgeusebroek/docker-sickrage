# Docker sickrage

	docker run -d \
		-h sickrage \
		-v /config/sickbard:/config \
		-v /downloads:/downloads \
		-v /media:/media \
		-p 8081:8081 \
		--restart=always jgeusebroek/sickrage