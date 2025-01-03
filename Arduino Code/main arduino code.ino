#include <NTPClient.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiUdp.h>

#define R_S D1
#define RELAY_M1 D3
#define RELAY_M2 D4
#define SM1 D5
#define SM2 D6
#define SM3 D7 
#define SM4 D8

// on Time set 
const int onhour= 12;
const int onmin= 9;
//Off time set
const int offhour= 12;
const int offmin= 10;
char dayWeek [7][12] = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
//String formattedDate;
//String dayStamp; 
const char *ssid     = "NODEMCU";
const char *password = "123456789";
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "in.pool.ntp.org", 19800, 60000);

//Flow Meter 1
const byte interruptPin1 = D2;
volatile long flow_f1 = LOW;
unsigned int Total_water1;
unsigned long currentTime1;
unsigned long cloopTime1;

//Flow Meter 2
const byte interruptPin2 = 9;//S3 Pin of NodeMCU
volatile long flow_f2 = LOW;
unsigned int Total_water2;
unsigned long currentTime2;
unsigned long cloopTime2;

int R_SV, SMV1, SMV2, SMV3, SMV4 , twater1, twater2, Total_Used;

//FUNCTION Void Setup
void setup() 
{
  pinMode(R_S,INPUT);
  pinMode(SM1,INPUT);
  pinMode(SM2,INPUT);
  pinMode(SM3,INPUT);
  pinMode(SM4,INPUT);
  pinMode(RELAY_M1, OUTPUT);
  pinMode(RELAY_M2, OUTPUT);
  digitalWrite(RELAY_M1, HIGH);
  digitalWrite(RELAY_M2, HIGH);
 
  //Flow Meter 1
  pinMode(interruptPin1, INPUT);
  pinMode(interruptPin2, INPUT);
  attachInterrupt(digitalPinToInterrupt(interruptPin1), flow1, RISING);
  attachInterrupt(digitalPinToInterrupt(interruptPin2), flow2, RISING);
  Serial.begin(115200);
  currentTime1 = millis();
  cloopTime1 = currentTime1;

  currentTime2 = millis();
  cloopTime2 = currentTime2;
  
  
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while ( WiFi.status() != WL_CONNECTED ) 
  {
    delay ( 500 );
    Serial.print ( "." ); 
  }
  Serial.println();
  Serial.println("NodeMCU is connected");
  Serial.println(WiFi.localIP());
  timeClient.begin();
 }

void loop() 
{
    timeClient.update();
    Serial.print("Time: ");
    Serial.print(timeClient.getHours());
    Serial.print(":");

    Serial.print(timeClient.getMinutes());
    Serial.print(":");
    Serial.println(timeClient.getSeconds());
    int day = timeClient.getDay();
    Serial.print("Day : ");
    Serial.println(dayWeek[day]);
  
    SMSV_F();

    if(R_SV == 1)
     {
       if(timeClient.getHours()== onhour && timeClient.getMinutes()== onmin)
         {  
           if(day == 1 || day == 3|| day == 5|| day == 7)
             {
              digitalWrite(RELAY_M1, LOW); //Relay module 1 on
             }
         }
       else if(timeClient.getHours()== offhour && timeClient.getMinutes()== offmin)
         {
            digitalWrite(RELAY_M1, HIGH); //Relay module 1 off
         }
    
       if(timeClient.getHours()==onhour && timeClient.getMinutes()==onmin)
        {  
          if(day == 1 || day == 3|| day == 5|| day == 7)
            {
              digitalWrite(RELAY_M2, LOW);  //Relay module 2 on
            }
        }
      else if(timeClient.getHours()==offhour && timeClient.getMinutes()==offmin )
       {
         digitalWrite(RELAY_M2, HIGH);  //Relay module 2 off
       }
  }
  else
    {
         digitalWrite(RELAY_M1, HIGH); //Relay module 1 off
         digitalWrite(RELAY_M2, HIGH); //Relay module 2 off
    }

     //Flow Meter 1
     currentTime1 = millis();
     if(currentTime1 >= (cloopTime1 + 1000))
       {
           cloopTime1 = currentTime1; 
           Total_water1 = (flow_f1 / 7.5); 
           twater1 = twater1+Total_water1;
           flow_f1 = 0;
           Serial.print("Total_water1 : ");
           Serial.print(Total_water1, DEC);
           Serial.println(" L/min");
       }
     //Flow Meter 2
     currentTime2 = millis();
     if(currentTime2 >= (cloopTime2 + 1000))
       {
           cloopTime2 = currentTime2; 
           Total_water2 = (flow_f2 / 7.5);
           twater2 = Total_water2;
           flow_f2 = 0;
           Serial.print("Total_water2 : ");
           Serial.print(Total_water2, DEC);
           Serial.println(" L/min");

           
       }
       
       Total_Used = twater1 + twater2 ;
       Serial.print("Total Water used : ");
       Serial.println(Total_Used);
      delay(5000);
}

void SMSV_F()
{
  R_SV = digitalRead(R_S);
  SMV1 = digitalRead(SM1);
  SMV2 = digitalRead(SM2);
  SMV3 = digitalRead(SM3);
  SMV4 = digitalRead(SM4);  

  if (SMV1 == 0||SMV2 == 0)
  {
    Serial.println("Water is present.");
  }
  else
  {
    Serial.println("Water is not present.");
  }

  
  if (SMV3 == 0||SMV4 == 0)
  {
    Serial.println("Water is present.");
  }
  else
  {
    Serial.println("Water is not present.");
  }
  
}

// Interrupt Function 
ICACHE_RAM_ATTR void flow1() {
  flow_f1++;
}

ICACHE_RAM_ATTR void flow2() {
  flow_f2++;
}
