package models;

public class Song {

    private int id;
    private String title;
    private int duration;
    private int likes;
    private String src;
    private int listens;
    private String desc;
    private Genre genre;
    private Album alb;

    public Song() {
    }

    public Song(int id, String title, int duration, int likes, String src, int listens, String desc, Genre gender, Album alb) {
        this.id = id;
        this.title = title;
        this.duration = duration;
        this.likes = likes;
        this.src = src;
        this.listens = listens;
        this.desc = desc;
        this.genre = gender;
        this.alb = alb;
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

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public int getListens() {
        return listens;
    }

    public void setListens(int listens) {
        this.listens = listens;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public Album getAlb() {
        return alb;
    }

    public void setAlb(Album alb) {
        this.alb = alb;
    }

}
