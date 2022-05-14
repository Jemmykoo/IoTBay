package uts.isd.model;

public class Log {

    public String description;
    public int id;
    public int userid;
    public String date;

    public Log() {
    }

    public Log(String description, int id, int userid, String date) {
        this.description = description;
        this.id = id;
        this.userid = userid;
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
