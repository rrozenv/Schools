//
//  School.swift
//  Domain
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation

public struct School: Equatable {
    public let id: String
    public let name: String
    public let phoneNumber: String
    public let city: String
    public let address: String
    public let state: String
    
    public init(id: String,
                name: String,
                phoneNumber: String,
                city: String,
                address: String,
                state: String) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.city = city
        self.address = address
        self.state = state
    }
}

extension School: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case phoneNumber = "phone_number"
        case city
        case address = "primary_address_line_1"
        case state = "state_code"
    }
}

//"dbn":"08X282",
//"school_name":"Women's Academy of Excellence",
//"phone_number":"718-542-0740",
//"city":"Bronx",
//"primary_address_line_1":"456 White Plains Road",
//"state_code":"NY",

//"academicopportunities1":"Genetic Research Seminar, Touro College Partnership, L'Oreal Roll Model Program, Town Halls, Laptop carts, SMART Boards in every room, Regents Prep.",
//"academicopportunities2":"WAE Bucks Incentive Program, Monroe College JumpStart, National Hispanic Honor Society, National Honor Society,Lehman College Now, Castle Learning.",
//"academicopportunities3":"Pupilpath, Saturday school, Leadership class, College Trips, Teen Empowerment Series, College Fairs, Anti-bullying Day, Respect for All, Career Day.",
//"academicopportunities4":"PEARLS Awards, Academy Awards, Rose Ceremony/Parent Daughter Breakfast, Ice Cream Social.",
//"academicopportunities5":"Health and Wellness Program",
//"addtl_info1":"Community Service Expected; Online Grading System; Saturday Programs; Student/Parent Orientation; Uniform",
//"admissionspriority11":"Priority to New York City residents who attend an information session",
//"admissionspriority21":"Then to New York City residents",
//"attendance_rate":"0.790000021",
//"bbl":"2034780018",
//"bin":"2020580",
//"boro":"X",
//"borough":"BRONX    ",
//"building_code":"X174",
//"bus":"Bx22, Bx27, Bx36, Bx39, Bx5",
//"census_tract":"4",
//"city":"Bronx",
//"code1":"Y01T",
//"college_career_rate":"0.486000001",
//"community_board":"9",
//"council_district":"18",

//"diplomaendorsements":"Science",
//"eligibility1":"Open only to female students",
//"ell_programs":"English as a New Language",
//"end_time":"2:45pm",
//"extracurricular_activities":"Academy of Health, Advisory, Annual Breast Cancer Walk, Purses for Life, Ambassadors, Conflict Resolution Program-Effective Alternatives in Reconciliation Services (EARS), Peer Tutoring, Student Government, Step Team, Cheerleading, Big Sister/Little Sister Program, Chorus",
//"fax_number":"718-542-0841",
//"finalgrades":"9-12",
//"girls":"1",
//"grade9geapplicants1":"330",
//"grade9geapplicantsperseat1":"4",
//"grade9gefilledflag1":"N",
//"grade9swdapplicants1":"52",
//"grade9swdapplicantsperseat1":"2",
//"grade9swdfilledflag1":"N",
//"grades2018":"9-12",
//"graduation_rate":"0.612999976",
//"interest1":"Science & Math",
//"language_classes":"Spanish",
//"latitude":"40.81504",
//"location":"456 White Plains Road, Bronx NY 10473 (40.815043, -73.85607)",
//"longitude":"-73.8561",
//"method1":"Limited Unscreened",
//"neighborhood":"Castle Hill-Clason Point",
//"nta":"Soundview-Castle Hill-Clason Point-Harding Park                            ",
//"offer_rate1":"Â—89% of offers went to this group",
//"overview_paragraph":"The WomenÂ’s Academy of Excellence is an all-girls public high school, serving grades 9-12. Our mission is to create a community of lifelong learners, to nurture the intellectual curiosity and creativity of young women and to address their developmental needs. The school community cultivates dynamic, participatory learning, enabling students to achieve academic success at many levels, especially in the fields of math, science, and civic responsibility. Our scholars are exposed to a challenging curriculum that encourages them to achieve their goals while being empowered to become young women and leaders. Our Philosophy is GIRLS MATTER!",
//"pct_stu_enough_variety":"0.330000013",
//"pct_stu_safe":"0.629999995",
//"phone_number":"718-542-0740",
//"primary_address_line_1":"456 White Plains Road",
//"program1":"WomenÂ’s Academy of Excellence",
//"psal_sports_boys":"Baseball, Basketball, Cross Country, Fencing",
//"psal_sports_coed":"Stunt",
//"psal_sports_girls":"Basketball, Cross Country, Indoor Track, Outdoor Track, Softball, Volleyball",
//"school_accessibility_description":"1",
//"school_email":"sburns@schools.nyc.gov",
//"school_name":"Women's Academy of Excellence",
//"seats101":"No",
//"seats9ge1":"86",
//"seats9swd1":"22",
//"shared_space":"Yes",
//"start_time":"8:20am",
//"state_code":"NY",
//"subway":"N/A",
//"total_students":"338",
//"website":"schools.nyc.gov/SchoolPortals/08/X282",
//"zip":"10473"
