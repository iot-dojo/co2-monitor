# co2-monitor
hands on v8
---
1. Rasbian Version.10(Buster)でテスト

 * cd /home/pi
 * mkdir iot-dojo
 * cd iot-dojo
 * git init
 * git clone https://github.com/iot-dojo/co2-monitor.git
 * cd co2-monitor

2. mh_z19のインストール

 * pip3 install mh-z19
 * sudo python3 -m mh_z19

3. mackerel-agentのインストール

 * curl -sL https://github.com/mackerelio/mackerel-agent/releases/latest/download/mackerel-agent_linux_arm.tar.gz | tar xz
 * sudo mkdir -p /usr/local/bin /etc/mackerel-agent
 * sudo cp mackerel-agent_linux_arm/mackerel-agent /usr/local/bin
 * sudo cp mackerel-agent_linux_arm/mackerel-agent.conf /etc/mackerel-agent
 * sudo mackerel-agent init -apikey="YOUR API KEY"
 * vi /lib/systemd/system/mackerel-agent.service
   [Unit]
   Description=mackerel-agent
   After=network.target network-online.target

   [Service]
   Type=simple
   ExecStart=/usr/local/bin/mackerel-agent
   ExecReload=/bin/kill -HUP $MAINPID
   KillMode=control-group
   Restart=on-failure

   [Install]
   WantedBy=multi-user.target
   Alias=mackerel-agent.service

 * sudo systemctl enable mackerel-agent
 * sudo systemctl start mackerel-agent

4. カスタムメトリックの追加

 * vi /etc/mackerel-agent/mackerel-agent.conf
   [plugin.metrics.co2]
   command = "/home/pi/iot-dojo/co2-monitor/get-co2.sh"


