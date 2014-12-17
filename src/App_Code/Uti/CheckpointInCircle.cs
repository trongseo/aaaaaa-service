using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CheckpointInCircle
/// </summary>
public class CheckpointInCircle
{
    public CheckpointInCircle()
    {
       
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="latx1"></param>
    /// <param name="longy1"></param>
    /// <param name="bankinh1">tinh bang met</param>
    public CheckpointInCircle(double latx1, double longy1,double bankinh1)
	{
        latx = latx1;
        longy = longy1;
        bankinh = bankinh1;
	}
    public double latx = 0;
    public double longy = 0;
    /// <summary>
    /// tinh bang met
    /// </summary>
    public double bankinh = 0;
    
    public bool PointInCircle(double latx1, double longy1)
    {
       
        //khoan cach tu Tam duong tron den diem
        double inkm = distance(latx, longy, latx1, longy1, 'K');
        //ban kinh cua duong tron
        double inkm1 = bankinh / 1000d;
        //Neu khoan cach<ban kinh cua duong tron==>diem nam trong
        if (inkm < inkm1)
        {
            return true;
        }
        return false;
    }
    private double distance(double lat1, double lon1, double lat2, double lon2, char unit)
    {
        double theta = lon1 - lon2;
        double dist = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * Math.Cos(deg2rad(theta));
        dist = Math.Acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == 'K')
        {
            dist = dist * 1.609344;
        }
        else if (unit == 'N')
        {
            dist = dist * 0.8684;
        }
        return (dist);
    }

    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::  This function converts decimal degrees to radians             :::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    private double deg2rad(double deg)
    {
        return (deg * Math.PI / 180.0);
    }

    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::  This function converts radians to decimal degrees             :::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    private double rad2deg(double rad)
    {
        return (rad / Math.PI * 180.0);
    }
    public double gpsCordDistance(double pointLat, double pointLon, double locLat, double locLon)
    {
        double R = 6371; // Earth Radius
        double dLat = deg2rad(pointLat - locLat);
        double dLon = deg2rad(pointLon - locLon);
        double lat1 = deg2rad(locLat);
        double lat2 = deg2rad(pointLat);

        double a = Math.Sin(dLat / 2) * Math.Sin(dLat / 2) +
                Math.Sin(dLon / 2) * Math.Sin(dLon / 2) * Math.Cos(lat1) * Math.Cos(lat2);
        double c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
        double d = R * c;

        return d;
    }
}