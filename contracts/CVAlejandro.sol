pragma solidity ^0.4.0;

import "./Mortal.sol";
import "./CVExtender.sol";



contract CVAlejandro is Mortal, CVExtender {

    string[] _experience;
    string[] _education;
    string[] _language;

    string _name;
    string _summary;
    string _email;
    string _link;
    string _description;
    string _title;

    // Social
    string _linkedIn;
    string _twitter;
    string _github;



    function CVAlejandro() {

        // Main
        _name = "Alejandro Saucedo";
        _email = "a@e-x.io";
        _link = "https://github.com/axsauze/ethereum-solidity-cv-contract";
        _description = "CTO. Manager. Engineer.";
        _title = "Alejandro ETH CV";

        // Social
        _linkedIn = "http://linkedin.com/in/axsaucedo";
        _github = "https://github.com/axsauze";
        _twitter = "https://twitter.com/axsaucedo";

        // Experience
        _experience.push("J.P. Morgan, Java Engineer");
        _experience.push("CTVE Shanghai China, English Teacher & Coordinator");
        _experience.push("Bloomberg LP, Software Engineer Intern");
        _experience.push("WakeUpRoulette, Founder & Chief Technology Officer");
        _experience.push("GitHack, Founder & Open Source Lead Engineer");
        _experience.push("Founders4Schools, Advisor");
        _experience.push("Techstars, Global Facilitator");
        _experience.push("HackaGlobal, Founder & Managing Director");
        _experience.push("Bloomberg LP, Full Stack Software Engineer");
        _experience.push("Hack Partners, Co-founder & Chief Technology Officer");
        _experience.push("Entrepreneur First, Entrepreneur in Residence");
        _experience.push("Exponential Technologies, Founder & Chief Engineer");

        // Education
        _education.push("University of Southampton, BEng. Software Engineering (1st Class Honours)");

        // Languages
        _language.push("English");
        _language.push("Spanish");
        _language.push("Mandarin");
        _language.push("Russian");
        _language.push("Portuguese");
    }

    // UTIL

    function strArrayConcat(string[] storage array) internal returns (string){

        uint totalSize = 0;
        uint i = 0;
        uint j = 0;
        uint strIndex = 0;
        bytes memory currStr;

        for(i = 0; i < array.length; i++) {
            currStr = bytes(array[i]);
            // We add the total plus the \n character
            totalSize = totalSize + currStr.length + 1;
        }

        string memory stringBuffer = new string(totalSize);
        bytes memory bytesResult = bytes(stringBuffer);

        for(i = 0; i < array.length; i++) {
            currStr = bytes(array[i]);

            for(j = 0; j < currStr.length; j++) {
                bytesResult[strIndex] = currStr[j];
                strIndex = strIndex + 1;
            }

            bytesResult[strIndex] = byte("\n");
            strIndex = strIndex + 1;
        }

        return string(bytesResult);
    }


    // MAIN

    function getEmail() constant returns(string) {
        return _email;
    }

    function setEmail(string email) onlyOwner {
        _email = email;
    }

    function getName() constant returns(string) {
        return _name;
    }

    function setName(string name) onlyOwner {
        _name = name;
    }

    function getSummary() constant returns(string) {
        return _summary;
    }

    function setSummary(string summary) onlyOwner {
        _summary = summary;
    }



    // EXPERIENCE

    function getExperience() constant returns(string) {
        return strArrayConcat(_experience);
    }

    function addExperience(string experience) onlyOwner {
        _experience.push(experience);
    }

    function getEducation() constant returns(string) {
        return strArrayConcat(_education);
    }

    function addEducation(string education) onlyOwner {
        _education.push(education);
    }

    function getLanguages() constant returns(string) {
        return strArrayConcat(_language);
    }

    function addLanguages(string language) onlyOwner {
        _language.push(language);
    }

    function getLinkedIn() constant returns(string) {
        return _linkedIn;
    }

    function setLinkedin(string linkedIn) onlyOwner {
        _linkedIn = linkedIn;
    }

    function getGithub() constant returns(string) {
        return _github;
    }

    function setGithub(string github) onlyOwner {
        _github = github;
    }

    function getTwitter() constant returns(string) {
        return _twitter;
    }

    function setTwitter(string twitter) onlyOwner {
        _twitter = twitter;
    }



    // INHERITED from CVExtender

    function getAddress() constant returns(string) {
        return _link;
    }

    function setAddress(string link) onlyOwner {
        _link = link;
    }

    function getDescription() constant returns(string) {
        return _description;
    }

    function setDescription(string description) onlyOwner {
        _description = description;
    }

    function getTitle() constant returns(string) {
        return _title;
    }

    function setTitle(string title) onlyOwner {
        _title = title;
    }

    function getAuthor() constant returns(string, string) {
        return (_name, _email);
    }

}
