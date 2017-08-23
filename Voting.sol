pragma solidity ^0.4.10;

contract Voting {
	// uint8 - целое число без знака для хранения подсчетов голосов
	// bytes32 - это тип для имени кандидата
	mapping (bytes32 => uint8) public votesReceived; 


	// в этом массиве из байтов32 будем хранить список кандидатов
	bytes32[] public candidateList;


	// это конструктор, который вызывается один раз при деплое в блокчейн
	// название конструктора как и название контракта
	function Voting (bytes32[] candidateNames) {
		candidateList = candidateNames;
	}	

	// возвращает общее количество голосов за конкретного кандидата
	 function totalVotesFor(bytes32 candidate) returns (uint8) {
	    if (validCandidate(candidate) == false) throw;
	    return votesReceived[candidate];
	  }

	// эквивалент голосованию, где увеличивает количество голосов
	  function voteForCandidate(bytes32 candidate) {
	    if (validCandidate(candidate) == false) throw;
	    votesReceived[candidate] += 1;
	  }

	// проверка кандидата на валидность
	  function validCandidate(bytes32 candidate) returns (bool) {
	    for(uint i = 0; i < candidateList.length; i++) {
	      if (candidateList[i] == candidate) {
	        return true;
	      }
	    }
	    return false;
	  }
}