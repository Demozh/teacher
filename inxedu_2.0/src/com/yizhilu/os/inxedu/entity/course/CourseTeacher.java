package com.yizhilu.os.inxedu.entity.course;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = false)
public class CourseTeacher implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
    private Integer courseId;
    private Integer teacherId;
}
