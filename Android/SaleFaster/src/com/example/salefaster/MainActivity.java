package com.example.salefaster;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;























import com.example.salefaster.DaoMaster.DevOpenHelper;
import com.example.salefaster.SanPhamDao.Properties;

import de.greenrobot.dao.query.QueryBuilder;
import android.support.v7.app.ActionBarActivity;
import android.text.style.TtsSpan.OrdinalBuilder;
import android.app.AlertDialog;
import android.app.LauncherActivity.ListItem;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.opengl.Visibility;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends ActionBarActivity {

	  private SQLiteDatabase db;
	    private DaoMaster daoMaster;
	    private DaoSession daoSession;
	    private SanPhamDao spDao;
	    private Handler  handler = new Handler();
	    private TextView edMaSP;   private EditText edTenSP;
	    private EditText edGiaBan;   
	    private String myid="";
	    private SanPham SP_UPDATE;
	    Context context1;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.test);
		edMaSP = (TextView) findViewById(R.id.edMaSP);
		edTenSP= (EditText) findViewById(R.id.edTenSP);
		edGiaBan= (EditText) findViewById(R.id.edGiaban);
		
		edGiaBan.addTextChangedListener(new NumberTextWatcher(edGiaBan));
		
		 View btnScan = findViewById(R.id.scan_button);
		 DevOpenHelper helper = new DaoMaster.DevOpenHelper(this, "store-db122", null);
	        db = helper.getWritableDatabase();
	        daoMaster = new DaoMaster(db);
	        daoSession = daoMaster.newSession();
	        spDao = daoSession.getSanPhamDao();
	        Bundle extras = getIntent().getExtras();
	        if (extras != null) {
	        	//edMaSP.setText();
	        	QueryBuilder<SanPham> qb = spDao.queryBuilder();
    			qb.where(Properties.Id.eq(extras.getString("myid")));
    			myid = extras.getString("myid");
    			 List<SanPham> datasp = qb.list();
    			int sizeI = datasp.size();
    			if(sizeI>0){
    				 SanPham crSP = new SanPham();
    				 for (SanPham element : datasp) {
    					  crSP=element;
    					  SP_UPDATE=crSP;
    					}
    				 setText(crSP);    					
    				 btnScan.setVisibility(View.GONE);
    			}
	        }
		
			// Scan button
		 // Scan button
	        btnScan.setOnClickListener(new OnClickListener() {
	            @Override
	            public void onClick(View v) {
	            	IntentIntegrator integrator = new IntentIntegrator(MainActivity.this);
	            	integrator.initiateScan();
	            }
	        });
	        final Context context = this;
	        context1=this;
	   	 View btncancel = findViewById(R.id.btnCancel);
			// Scan button
		 // Scan button
	   	btncancel.setOnClickListener(new OnClickListener() {
	            @Override
	            public void onClick(View v) {
	            	Intent intent = new Intent(context, LisItemActivity.class);
	                startActivity(intent);
	            }
	        });  
	        ///////////
	        View btnSave = findViewById(R.id.btnSave);
			// Scan button
		 // Scan button
	        btnSave.setOnClickListener(new OnClickListener() {
	            @Override
	            public void onClick(View v) {
	            	updateClick();
	            }
	        });
	        
	        View btnDel = findViewById(R.id.btnDelete);
	      
	        if(myid.equals("")){
	        	  btnDel.setVisibility(View.GONE);
	        }
	        btnDel.setOnClickListener(new OnClickListener() {
	            @Override
	            public void onClick(View v) {
	            	btnDelClick();
	            }
	        });
	        
		        
	}
	
	  public void btnDelClick(){
		  DialogInterface.OnClickListener dialogClickListener = new DialogInterface.OnClickListener() {
			  public void onClick(DialogInterface dialog, int which) { switch (which) { 
			  case DialogInterface.BUTTON_POSITIVE:
				  // Yes button clicked 
				  
				  spDao.delete(SP_UPDATE);
				  Toast.makeText(MainActivity.this, "Đã xóa!!!", Toast.LENGTH_LONG).show();
					Intent intent = new Intent(context1, LisItemActivity.class);
	                startActivity(intent);
				  break; 
				  case DialogInterface.BUTTON_NEGATIVE: 
					  // No button clicked // do nothing 
					  Toast.makeText(MainActivity.this, "No Clicked", Toast.LENGTH_LONG).show(); break;
					  } } };
					  AlertDialog.Builder builder = new AlertDialog.Builder(this);
					  builder.setMessage("Bạn muốn xóa?") .setPositiveButton("Xóa", dialogClickListener) .setNegativeButton("Thôi", dialogClickListener).show();

					  
			  
	  }
	  public void updateClick(){
          
 	        daoMaster = new DaoMaster(db);
 	        daoSession = daoMaster.newSession();
 	        spDao = daoSession.getSanPhamDao();
 			SanPham sp = new SanPham( );
        	String masp= ((EditText) findViewById(R.id.edMaSP)).getText().toString();
        	String tensp= ((EditText) findViewById(R.id.edTenSP)).getText().toString();
        	float giaban= Float.parseFloat( ((EditText) findViewById(R.id.edGiaban)).getText().toString().replace(",", ""));
         	float giamua= Float.parseFloat( ((EditText) findViewById(R.id.edGiamua)).getText().toString().replace(",", ""));
        	int soluong= Integer.parseInt( ((EditText) findViewById(R.id.edSoLuong)).getText().toString().replace(",", ""));
        	
        	if(((EditText) findViewById(R.id.edMaSP)).getText().toString().length()==0){
				 Toast.makeText(getApplicationContext(),"Vui lòng scan mã!", Toast.LENGTH_LONG).show();
				 ((EditText) findViewById(R.id.edMaSP)).requestFocus();
				 return;
			}
        	
        	if(myid.length()>0){
				 
				
				 SP_UPDATE.setId(Long.parseLong( myid));
				 SP_UPDATE.setBarcode(edMaSP.getText().toString());
				 SP_UPDATE.setDateUpdate(new Date());
				 SP_UPDATE.setGiaBan(giaban);
				 SP_UPDATE.setGiaMua(giamua);
				 SP_UPDATE.setTenSP(tensp);
				 SP_UPDATE.setSoLuong(soluong);
	        		spDao.update(SP_UPDATE);
	        		 Toast.makeText(getApplicationContext(),"Đã cập nhật xong!", Toast.LENGTH_LONG).show();
				return;
			}
        	
        	QueryBuilder<SanPham> qb = spDao.queryBuilder();
			qb.where(Properties.Barcode.eq(edMaSP.getText().toString()));
		
			 List<SanPham> datasp = qb.list();
			int sizeI = datasp.size();
			if(sizeI>0){
				 Toast.makeText(getApplicationContext(),"Sản phẩm này đã có rồi!", Toast.LENGTH_LONG).show();
					return;
			}
    		sp.setBarcode(edMaSP.getText().toString());
    		sp.setDateCreate(new Date());
    		sp.setDateUpdate(new Date());
    		sp.setGiaBan(giaban);
    		sp.setGiaMua(giamua);
    		sp.setTenSP(tensp);
    		sp.setSoLuong(soluong);
    		spDao.insert(sp);
    		LoadGridView();
    		clearText();
    		 Toast.makeText(getApplicationContext(),"Đã thêm xong!", Toast.LENGTH_LONG).show();
			 ((EditText) findViewById(R.id.edMaSP)).requestFocus();
        }
	  public void setText(SanPham sp){
		  ((EditText) findViewById(R.id.edMaSP)).setText(sp.getBarcode().toString());
		  ((EditText) findViewById(R.id.edMaSP)).setEnabled(false);
		  ((EditText) findViewById(R.id.edGiaban)).setText(sp.getGiaBan().toString());
		  ((EditText) findViewById(R.id.edGiamua)).setText(sp.getGiaMua().toString());
		  ((EditText) findViewById(R.id.edSoLuong)).setText(sp.getSoLuong().toString());
		  ((EditText) findViewById(R.id.edTenSP)).setText(sp.getTenSP().toString());
	  }
	  
	  public void clearText(){
		  ((EditText) findViewById(R.id.edMaSP)).setText("");
		  ((EditText) findViewById(R.id.edGiaban)).setText("0");
		  ((EditText) findViewById(R.id.edGiamua)).setText("0");
		  ((EditText) findViewById(R.id.edMaSP)).setText("");
		  ((EditText) findViewById(R.id.edSoLuong)).setText("1");
		  ((EditText) findViewById(R.id.edTenSP)).setText("");
	  }
	  public void LoadGridView(){
		  final ListView listView=(ListView) findViewById(R.id.gridView1);
			QueryBuilder<SanPham> qb = spDao.queryBuilder();
			//qb.where(Properties.Id.eq(sp.getId()));
			qb.orderDesc(Properties.DateCreate);
			List<SanPham> youngJoes = qb.list();
		   String stringArray[];        
		   stringArray=new String[youngJoes.size()];
		   int i=0;
		   for (SanPham element : youngJoes) {
			     stringArray[i] =element.getTenSP();
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
	  }
	  
		@Override
		public void onActivityResult(int requestCode, int resultCode, Intent intent) {
			  IntentResult scanResult = IntentIntegrator.parseActivityResult(requestCode, resultCode, intent);
			  if (scanResult != null) {
			    // handle scan result
				  edMaSP.setText(scanResult.getContents());
				  edTenSP.setFocusable(true);
			  }
			}
		
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
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
