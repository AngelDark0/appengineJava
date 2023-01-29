/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
public class Cliente {
    
    OkHttpClient cliente= new OkHttpClient();
    
  public  JSONObject getJSON(String url){
        Request request = new Request.Builder()
                .url(url)
                .build();
        try(Response response = cliente.newCall(request).execute()){
            JSONObject json= new JSONObject(response.body().string());
            return  json;
        }catch(Exception e)
        {
            System.out.println("Error"+
            e);
            return null;
        }
    }
    public JSONObject postJSON(String url, RequestBody datos){
          Request request = new Request.Builder().url(url)
                  .post(datos).build();
          
          try (Response response = cliente.newCall(request).execute()){
               JSONObject json= new JSONObject(response.body().string());
               return  json;
            
        } catch (Exception e) {
              System.out.println("ERROR "
              +e);
              return null;
        }
    }
    
}
