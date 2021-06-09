pragma solidity ^0.5.0;

contract DeStor {
  string public name = 'DeStor';
  uint public fileCount = 0;
  
  
  mapping( uint => File) public files;

  struct File {
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    string fileDescription;
    uint uploadTime;
    address payable uploader;

  }
  // Event
  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    string fileDescription,
    uint uploadTime,
    address payable uploader
  );

  constructor() public {
  }

  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, string memory _fileDescription) public {
    
    // Make sure the file hash exists
    require(bytes(_fileHash).length > 0);
    // Make sure the file type exists
    require(bytes(_fileType).length > 0);
    // Make sure the file description exists
    require(bytes(_fileDescription).length > 0);
    // Make sure the file name exists
    require(bytes(_fileName).length > 0);
    // Make sure the uploader address exists
    require(msg.sender!=address(0));
    // Make sure the file size is more than 0
    require(_fileSize>0);

    fileCount++;

    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription,now, msg.sender);

    // Trigger an event
    emit FileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription,now, msg.sender);
  }


}