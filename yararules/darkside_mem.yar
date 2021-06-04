rule darkside_onMemory
{
	strings:
		$st0 = "Possible security threat: Client is calling a remote endpoint without mutual authentication" ascii wide
		$st1 = "Possible security threat: Client is calling a remote endpoint without RPC_C_AUTHN_LEVEL_PKT_PRIVACY" ascii wide
		$st4 = "OpenEncryptedFileRaw" ascii wide
		$st5 = "SetEncryptedFileMetadata" ascii wide
		$st6 = "Could not unprotect memory to disable turbo dispatch" ascii wide
		$st7 = "A verb was invoked on an items in the view" ascii wide
		$st8 = "FILLER51.EXE" ascii wide
		$st9 = ".idata$2" ascii wide
		$st10 = ".idata$3" ascii wide
		$st11 = ".idata$4" ascii wide
		$st12 = ".idata$5" ascii wide
		$st13 = "OpusApp" ascii wide
		$st14 = "CredEncryptAndMarshalBinaryBlob" ascii wide
		$st15 = "UsePinForEncryptedFiles" ascii wide
		$st16 = "PvkFreeCryptProv" ascii wide
		$st17 = "vCryptXmlVerifySignature" ascii wide
		$st18 = "BitLockerDriveEncryption" ascii wide
	condition:
		all of them
}
