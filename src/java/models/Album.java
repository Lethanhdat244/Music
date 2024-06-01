package models;

import java.util.Date;

/**
 *
 * @author thanh
 */
public class Album {

    private int id;

    private String title;
    private String img;
    private Date rdate;
    private String ptype;
    private Artist artist;
    private String desc;

    public Album() {
    }

    public Album(int id, String title, String img, Date rdate, String ptype, Artist artist, String desc) {
        this.id = id;
        this.title = title;
        this.img = img;
        this.rdate = rdate;
        this.ptype = ptype;
        this.artist = artist;
        this.desc = desc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

}
