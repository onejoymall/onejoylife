package com.webapp.board.common;

public class FileVO {
    private Integer fileno; 
    private String parentPK;
    private String filename;
    private String realname;
    private long filesize;
    private String filelink;
    private String filepath;
    private Integer fileorder;
    private Integer file_order;
    private String store_id;
    
    

    
    public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public Integer getFile_order() {
		return file_order;
	}

	public void setFile_order(Integer file_order) {
		this.file_order = file_order;
	}

	public Integer getFileorder() {
        return fileorder;
    }

    public void setFileorder(Integer fileorder) {
        this.fileorder = fileorder;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getFilelink() {
        return filelink;
    }

    public void setFilelink(String filelink) {
        this.filelink = filelink;
    }

    /**
     * 파일 크기를 정형화하기.
     */
    public String size2String() {
        Integer unit = 1024;
        if (filesize < unit) {
            return String.format("(%d B)", filesize);
        }
        int exp = (int) (Math.log(filesize) / Math.log(unit));

        return String.format("(%.0f %s)", filesize / Math.pow(unit, exp), "KMGTPE".charAt(exp - 1));
    }
    
    public Integer getFileno() {
        return fileno;
    }

    public void setFileno(Integer fileno) {
        this.fileno = fileno;
    }

    public String getParentPK() {
        return parentPK;
    }
    
    public void setParentPK(String parentPK) {
        this.parentPK = parentPK;
    } 
    
    public String getFilename() {
        return filename;
    }
    
    public void setFilename(String filename) {
        this.filename = filename;
    }
    
    public String getRealname() {
        return realname;
    }
    
    public void setRealname(String realname) {
        this.realname = realname;
    }
    
    public long getFilesize() {
        return filesize;
    }
    
    public void setFilesize(long filesize) {
        this.filesize = filesize;
    }
    
}
