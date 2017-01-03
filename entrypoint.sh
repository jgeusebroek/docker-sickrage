#!/bin/sh
set -x

USERNAME=${USERNAME:=sickrage}
GROUP=${GROUP:=sickrage}

TIMEZONE=${TIMEZONE:=Europe/Amsterdam}

# Add user if it does not exist
if ! id -u "${USERNAME}" >/dev/null 2>&1; then
	addgroup -g ${USER_GID:=4000} ${GROUP}
	adduser -G ${GROUP} -D -u ${USER_UID:=4000} ${USERNAME}
fi

cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
echo "${TIMEZONE}" > /etc/timezone && \

mkdir -p /config/cache

touch /config/config.ini
touch /config/sickbeard.db
touch /config/sickbeard.db.v32
touch /config/sickbeard.db.v33
touch /config/sickbeard.db.v34
touch /config/sickbeard.db.v35
touch /config/sickbeard.db.v36
touch /config/sickbeard.db.v37
touch /config/sickbeard.db.v38
touch /config/sickbeard.db.v39
touch /config/sickbeard.db.v40
touch /config/sickbeard.db.v41
touch /config/sickbeard.db.v42
touch /config/sickbeard.db.v43
touch /config/sickbeard.db.v44

chown -R ${USERNAME}:${GROUP} /config
chown -R ${USERNAME}:${GROUP} /sickrage

sudo -u ${USERNAME} -E sh -c "/usr/bin/python /sickrage/SickBeard.py --datadir=/config/ --config=/config/config.ini $@"