FROM toke/mosquitto:latest
LABEL org.freenas.interactive="false" 					\
      org.freenas.version="1" 						\
      org.freenas.upgradeable="true" 					\
      org.freenas.expose-ports-at-host="true" 				\
      org.freenas.autostart="true" 					\
      org.freenas.port-mappings="9001:9001/tcp,1883:1883/tcp"           \
      org.freenas.volumes="[						\
          {								\
              \"name\": \"/mqtt/config\",				\
              \"descr\": \"Config storage space\"			\
          },								\
	  {								\
	      \"name\": \"/mqtt/data\",					\
	      \"descr\": \"Data storage space\"				\
	  },								\
	  {                                                             \
              \"name\": \"/mqtt/log\",                                  \
              \"descr\": \"Storage space for the logs\"                 \
          }								\
      ]" 								\
      org.freenas.settings="[ 						\
          {								\
              \"env\": \"PGID\",					\
              \"descr\": \"GroupID\",					\
              \"optional\": true					\
          },								\
          {								\
              \"env\": \"PUID\",					\
              \"descr\": \"UserID\",					\
              \"optional\": true					\
          }								\
      ]"
RUN 	apt-get install unzip &&					\
	wget -qO- -O /mqtt/config/tokemosquitto.zip https://github.com/toke/docker-mosquitto/archive/master.zip && \
	unzip -f -qq /mqtt/config/tokemosquitto.zip -d /mqtt/config &&	\
	yes n | cp -ri /mqtt/config/docker-mosquitto-master/config /mqtt/config 2>/dev/null
