﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StudentRegistration.Api.DTOs
{
    public class StudentDto
    {
        public int StudentId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public int RegNo { get; set; }
        [Required]
        public string Gender { get; set; }
        [Required]
        public DateTime DateOfBirth { get; set; }
        [Required]
        public List<int> CourseCheckBoxList { get; set; }
    }
}