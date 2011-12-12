/*
 Basic MQTT example 

  - allocate Arduino Client IP Address via DHCP 
  - connects to an MQTT server
  - publishes "hello world" to the topic "outTopic"
  - subscribes to the topic "inTopic"
*/

#include <SPI.h>
#include <Ethernet.h>
#include <PubSubClient.h>

// Update these with values suitable for your network.
byte mac[]    = {  0xDE, 0xED, 0xBA, 0xFE, 0xFE, 0xED };
IPAddress server(172, 16, 0, 2);

void callback(char* topic, byte* payload,int length) {
  // handle message arrived
}

PubSubClient client(server, 1883, callback);

void setup()
{
  Ethernet.begin(mac); // Use DHCP to allocate IP

  if (client.connect("arduinoClient")) {
    client.publish("outTopic","hello world");
    client.subscribe("inTopic");
  }
}

void loop()
{
  client.loop();
}

