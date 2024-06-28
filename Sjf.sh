import java.util.Scanner;
class Process {
 int pid;               
 int AT;     
 int BT;  
 int CT;  
 int WT;     
 int TAT; 

 Process(int pid, int AT, int BT) {
     this.pid = pid;
     this.AT = AT;
     this.BT = BT;
 }
}

public class SJF {
 static void sjf(Process[] processes, int n) {
     int totalWT = 0;
     int totalTAT = 0;
     int currentTime = 0;
     int completed = 0;
     int shortest;

     while (completed != n) {
         shortest = -1;
         int minBurst = Integer.MAX_VALUE;

         for (int i = 0; i < n; i++) {
             if (processes[i].AT <= currentTime && processes[i].CT == 0) {
                 if (processes[i].BT < minBurst) {
                     shortest = i;
                     minBurst = processes[i].BT;
                 }
             }
         }

         if (shortest == -1) {
             currentTime++;
         } else {
             processes[shortest].CT = currentTime + processes[shortest].BT;
             processes[shortest].TAT = processes[shortest].CT - processes[shortest].AT;
             processes[shortest].WT = processes[shortest].TAT - processes[shortest].BT;
             totalWT += processes[shortest].WT;
             totalTAT += processes[shortest].TAT;
             currentTime = processes[shortest].CT;
             completed++;
         }
     }

     System.out.println("PID\tAT\tBT\tCT\tTAT\tWT\tRT");
     for (Process process : processes) {
         System.out.println(process.pid + "\t\t" + process.AT + "\t\t" + process.BT +
                 "\t\t" + process.CT + "\t\t" + process.TAT + "\t\t" +
                 process.WT+"\t\t"+ process.WT);
     }

     float avgWT = (float) totalWT / n;
     float avgTAT = (float) totalTAT / n;
     System.out.printf("\nAverage Waiting Time: %.2f\n", avgWT);
     System.out.printf("Average Turnaround Time: %.2f\n", avgTAT);
 }

 public static void main(String[] args) {
     Scanner scanner = new Scanner(System.in);
     System.out.print("Enter the number of processes: ");
     int n = scanner.nextInt();

     Process[] processes = new Process[n];

     System.out.println("Enter arrival time and burst time for each process:");
     for (int i = 0; i < n; i++) {
         System.out.print("Process " + (i + 1) + " Arrival Time: ");
         int arrivalTime = scanner.nextInt();
         System.out.print("Process " + (i + 1) + " Burst Time: ");
         int burstTime = scanner.nextInt();
         processes[i] = new Process(i + 1, arrivalTime, burstTime);
     }

     System.out.println();
     sjf(processes, n);
 }
