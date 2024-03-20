import { Button } from "./components/ui/button";
import { Wallet } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Link } from "react-router-dom";

export function App() {
  const connectToMetaMask = async () => {
    if (window.ethereum) {
      try {
        await window.ethereum.request({ method: "eth_requestAccounts" });
        alert("Connected to MetaMask successfully!");

        // Obtém o hash da carteira autenticada
        const walletHash = "hash_da_carteira_autenticada";

        // Redireciona para a rota "/home" com o hash da carteira como parâmetro de rota
        window.location.href = `/home?walletHash=${walletHash}`;
      } catch (error) {
        console.error("Error connecting to MetaMask:", error);
      }
    } else {
      alert("Please install MetaMask to connect.");
    }
  };

  return (
    <div className="relative">
      <img
        src="src/assets/img4.svg"
        alt="Logo"
        className="absolute top-0 left-0 m-5"
        style={{ width: "100px", height: "auto" }}
      />

      <Button
        className="absolute top-0 right-0 m-5 bg-black text-white hover:bg-gray-800"
        onClick={connectToMetaMask}
      >
        How does it work?
      </Button>

      <div className="grid grid-cols-2">
        <div className="bg-purple-900 p-4 flex justify-center items-center h-screen">
          <img
            src="./src/assets/eth.jpg"
            alt="Description of image"
            className="max-w-full max-h-full rounded-lg"
            style={{ width: "80%", height: "auto" }}
          />
        </div>

        <div className="bg-black flex flex-col justify-center items-center">
          <Card className="bg-black p-6 w-[400px] self-center border-none relative">
            <h1 className="text-3xl flex flex-col justify-center items-center text-white font-bold">
              A growing network of DeFi Contracts
            </h1>
            <h2 className="text-white py-6">
              Buyers, sellers, and institutions participate together in a
              financial marketplace that is open and accessible to all.
            </h2>

            <div className="flex flex-col justify-center items-center">
              <Button
                className="p-5 m-5 hover:bg-gray-200 bg-white text-black w-full"
                onClick={connectToMetaMask}
              >
                <Wallet className="w-5 h-5 mr-2" />
                Connect
              </Button>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
}
