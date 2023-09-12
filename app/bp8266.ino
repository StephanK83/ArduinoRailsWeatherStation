#include <ESP8266WiFi.h>
#include <Adafruit_BMP280.h>

const char* ssid = "Ihr_WLAN_Name";
const char* password = "Ihr_WLAN_Passwort";

Adafruit_BMP280 bmp;

void setup() {
  Serial.begin(115200);

  // WiFi-Verbindung
  Serial.println();
  Serial.println();
  Serial.print("Verbinde mit ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi verbunden");

  // BMP280 Initialisierung
  if (!bmp.begin()) {
    Serial.println("Konnte BMP280 Sensor nicht finden!");
    while (1);
  }
}

void loop() {
  Serial.print("Temperatur = ");
  Serial.print(bmp.readTemperature());
  Serial.println(" *C");

  Serial.print("Druck = ");
  Serial.print(bmp.readPressure() / 100.0F);
  Serial.println(" hPa");

  Serial.println();
  delay(5000);  // Aktualisiert alle 5 Sekunden
}
