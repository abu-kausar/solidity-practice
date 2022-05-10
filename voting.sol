// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract ASAVoting{
    uint[] candidate_names = [1, 2, 3];
    uint total_candidate = candidate_names.length;

    struct Candidate{
        uint identity;
        uint votes;
    }

    bool isVoting;
    mapping(address => Candidate) voters;
    mapping(string => uint)  candidate_votes;
    Candidate[] candidates;
 
    constructor() payable{
        isVoting = true;
        for(uint i = 0; i<total_candidate; i++){
            candidates.push(
                Candidate(
                    {
                        identity:i+1,
                        votes:0
                    }
                )
            );
        }
    } 
 
    function vote(uint n) public {
        require(isVoting,"Casting has done");
        candidates[n-1].votes++;
    }
    function end() public {
        isVoting = false;
    }
 
    function test() public view returns(Candidate[] memory){
        return candidates;
    } 
}