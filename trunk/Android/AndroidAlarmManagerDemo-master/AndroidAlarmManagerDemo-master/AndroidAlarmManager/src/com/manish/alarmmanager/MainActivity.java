package com.manish.alarmmanager;

import java.util.Calendar;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * 
 * @author manish
 *
 */

public class MainActivity extends Activity implements OnClickListener{

	Button btnStartAlarm,btnStopAlarm;
	Context context;
	static PendingIntent pendingIntent;
	static AlarmManager alarmManager;
	EditText edtext;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		context=MainActivity.this;
		

		Intent intentsOpen = new Intent(this, AlarmReceiver.class);
		intentsOpen.setAction("com.manish.alarm.ACTION");
		pendingIntent = PendingIntent.getBroadcast(this,111, intentsOpen, 0);
		alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);

		edtext = (EditText)findViewById(R.id.editText1);
		btnStartAlarm=(Button)findViewById(R.id.button1);
		btnStopAlarm=(Button)findViewById(R.id.button2);
		
		btnStartAlarm.setOnClickListener(this);
		btnStopAlarm.setOnClickListener(this);
		
	}
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		if(v==btnStartAlarm){
			fireAlarm();
		}
		if(v==btnStopAlarm){
			stopAlarm();
		}
	}
	public void fireAlarm() {
		/**
		 * call broadcost reciver
		 */
		Calendar calendar = Calendar.getInstance();
		//calendar.setTimeInMillis(System.currentTimeMillis());
		
		int sophut =  Integer.parseInt(edtext.getText().toString());//
		 calendar.add(Calendar.MINUTE, sophut);
		alarmManager.setRepeating(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), sophut* 60*1000,pendingIntent);
	  btnStopAlarm.setEnabled(true);
	  btnStartAlarm.setEnabled(false);
		Toast.makeText(this, "Đã thiết lập nhắc nhở xong! ",
				Toast.LENGTH_SHORT).show();
	
	}
	public void stopAlarm(){
				alarmManager.cancel(pendingIntent);
				btnStopAlarm.setEnabled(false );
				  btnStartAlarm.setEnabled(true);
					Toast.makeText(this, "Đã dừng xong! ",
							Toast.LENGTH_SHORT).show();
		
	}


}
