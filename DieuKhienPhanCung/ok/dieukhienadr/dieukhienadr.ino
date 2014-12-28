/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the Uno and
  Leonardo, it is attached to digital pin 13. If you're unsure what
  pin the on-board LED is connected to on your Arduino model, check
  the documentation at http://arduino.cc

  This example code is in the public domain.

  modified 8 May 2014
  by Scott Fitzgerald
 */

int incomingByte = 0; 
String str;
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 13 as an output.
   Serial.begin(9600);   
  pinMode(13, OUTPUT);     
}

// the loop function runs over and over again forever
void loop() {
 // send data only when you receive data:
        if (Serial.available() > 0) {
                // read the incoming byte:
               // incomingByte = Serial.read();
                str = Serial.readString(); 
               // str.substr (12,12);  
             String onoff  =  str.substring( str.length()-1,str.length() );
               String portd  =  str.substring(0, str.length()-1 );
if(onoff=="1")
{
  digitalWrite(portd.toInt(), HIGH);   // bật đèn led sáng
  delay(1000);
}
if(onoff=="0")
{
  digitalWrite(portd.toInt(),LOW);   // bật đèn led sáng
  delay(1000);
}
                // say what you got:
               // Serial.print(str);
                Serial.println(str+onoff+portd);
        }
}
