# ros2-pub-sub

* Build image: `docker build -t demo .`
* Run containers: `docker-compose up`. You should see the talker and listener communicating with each other.
* Open Wireshark: `https://localhost:14500/?username=wireshark&password=wireshark`
* Stop containers: `docker-compose down`

<hr />

### Note regarding Wireshark

The URL opens in Firefox by clicking on `Accept Risk & Continue`.
However, for Chromium-based browsers, you need to go to 'Allow invalid certificates for resources loaded from localhost.' in `chrome://flags`.
