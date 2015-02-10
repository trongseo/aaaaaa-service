package com.example.salefaster;

import java.text.DecimalFormat;
import java.util.List;

import com.example.salefaster.DaoMaster.DevOpenHelper;
import com.example.salefaster.SanPhamDao.Properties;




import de.greenrobot.dao.query.QueryBuilder;
import de.greenrobot.dao.query.WhereCondition;
import android.support.v7.app.ActionBarActivity;
import android.app.Activity;
import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.AdapterView.OnItemClickListener;
public class LisItemActivity extends Activity {
	  private SQLiteDatabase db;
	    private DaoMaster daoMaster;
	    private DaoSession daoSession;
	    private SanPhamDao spDao;
	    private Handler  handler = new Handler();
	    public ListView listView;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_lis_item);
		LoadGridView();
	  	 View btnSear = findViewById(R.id.btnSearch);
				// Scan button
			 // Scan button
	  	btnSear.setOnClickListener(new OnClickListener() {
		            @Override
		            public void onClick(View v) {
		            	LoadGridView();
		            }
		        }); 
	  	View btnAdd = findViewById(R.id.btnAdd);
	  	 final Context context = this;
		// Scan button
	 // Scan button
	  	btnAdd.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
            	Intent intent = new Intent(context, MainActivity.class);
                startActivity(intent);
            }
        });
	  	//
	  	
	  	
	}
	private boolean isEmpty(EditText etText) {
        return etText.getText().toString().trim().length() == 0;
    }
	public String arrID[];        
	public void LoadGridView(){
			EditText edTenSP= (EditText) findViewById(R.id.edTenSP);
			EditText edMaSP= (EditText) findViewById(R.id.edMaSP);
			DevOpenHelper helper = new DaoMaster.DevOpenHelper(this, "store-db122", null);
			db = helper.getWritableDatabase();
			daoMaster = new DaoMaster(db);
			daoSession = daoMaster.newSession();
			spDao = daoSession.getSanPhamDao();
			listView=(ListView) findViewById(R.id.gridView1);
			QueryBuilder<SanPham> qb = spDao.queryBuilder();
			if(!isEmpty(edMaSP)){
				qb.where(Properties.Barcode.eq(edMaSP.getText().toString()));	
			}
			//qb.and(Properties.TenSP.like('%'+edTenSP.getText().toString()+'%'), Properties.TenSP.ge(10));
			if(!isEmpty(edTenSP)){
				qb.where( Properties.TenSP.like('%'+edTenSP.getText().toString()+'%'));	
			}	
			
			qb.orderDesc(Properties.DateCreate);
			List<SanPham> youngJoes = qb.list();
		   String stringArray[];        
		   stringArray=new String[youngJoes.size()];
		   arrID=new String[youngJoes.size()];
		   int i=0;
		   DecimalFormat formatter = new DecimalFormat("#,###,###");

		   for (SanPham element : youngJoes) {
			   String number = formatter.format(element.getGiaBan());

			     stringArray[i] =element.getTenSP() +":"+number+"-"+element.getDateCreate();
			     arrID[i]=element.getId().toString();
			     i++;
			}
		       
		//Gán DataSource vào ArrayAdapter
		  ArrayAdapter<String>da=new ArrayAdapter<String>
		  (
		  this,
		  android.R.layout.simple_list_item_1,
		  stringArray
		  );
		  //gán Datasource vào GridView
		  listView.setAdapter(da);
		  ArrayAdapter<String>da1=new ArrayAdapter<String>
		  (
		  this,
		  R.layout.countries,
		  stringArray
		  );
		  final Context context1 = this;
		  listView.setOnItemClickListener(
					new AdapterView.OnItemClickListener() {
						public void onItemClick(AdapterView<?> arg0,
								View arg1, 
								int arg2,
								long arg3) {
							//đối số arg2 là vị trí phần tử trong Data Source (arr)
						//	txt.setText("position :"+arg2+" ; value ="+arr[arg2]);
		//Toast.makeText(getApplicationContext(),	 arg2+"x" , Toast.LENGTH_SHORT).show();
		Intent intent = new Intent(context1, MainActivity.class);
		intent.putExtra("myid", arrID[arg2]);
        startActivity(intent);
		
							
						}
					});
			
		 
			
	  }
	  
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.lis_item, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
