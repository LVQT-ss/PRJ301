/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Zane
 */
public class Airplanes {
    
    String id;
    String destination;
    String departureTime;
    boolean isDelay;

    public Airplanes() {
    }

    public Airplanes(String id, String destination, String departureTime, boolean isDelay) {
        this.id = id;
        this.destination = destination;
        this.departureTime = departureTime;
        this.isDelay = isDelay;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public boolean isIsDelay() {
        return isDelay;
    }

    public void setIsDelay(boolean isDelay) {
        this.isDelay = isDelay;
    }

    
    
    
    
}
