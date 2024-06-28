import java.util.Scanner;
public class Fcfs{
    public static void main(String args[]){
        Scanner sc=new Scanner(System.in);
        int size,i,j,temp,tatAvg=0,wtAvg=0;
        System.out.println("Enter the Number of Process: ");
        size=sc.nextInt();
        int pid[]=new int[size];
        int at[]=new int[size];
        int bt[]=new int[size];
        int ct[]=new int[size];
        int tat[]=new int[size];
        int wt[]=new int[size];
        for(i=0;i<size;i++){
            System.out.println("Enter Arrival Time for "+(i+1)+"th Process: ");
            at[i]=sc.nextInt();
            System.out.println("Enter Brust Time for "+(i+1)+"th Process: ");
            bt[i]=sc.nextInt();
            pid[i]=i+1;
        }
        for(i=0;i<size-1;i++){
            for(j=i+1;j<size;j++){
                if(at[i]>at[j]){
                    temp=at[i];
                    at[i]=at[j];
                    at[j]=temp;
                    temp=bt[i];
                    bt[i]=bt[j];
                    bt[j]=temp;
                    temp=pid[i];
                    pid[i]=pid[j];
                    pid[j]=temp;
                }
            }
        }
        for(i=0;i<size;i++){
            if(i==0){
                ct[i]=at[i]+bt[i];
            }
            else if(ct[i-1]>at[i]){
                ct[i]=ct[i-1]+bt[i];
            }
            else{
                ct[i]=at[i]+bt[i];
            }
            tat[i]=ct[i]-at[i];
            wt[i]=tat[i]-bt[i];
        }
        System.out.println("Pid     AT      BT      CT      TAT     WT\n==========================================");
        for(i=0;i<size;i++){
            System.out.printf("%d       %d       %d        %d         %d      %d\n",pid[i],at[i],bt[i],ct[i],tat[i],wt[i]);
        }
        for(i=0;i<size;i++){
            tatAvg=tatAvg+tat[i];
            wtAvg=wtAvg+wt[i];
        }
        double s=Double.parseDouble(String.valueOf(size));
        System.out.println("Average Turn Around Time: "+tatAvg/s);
        System.out.println("Average Waiting Time: "+wtAvg/s);
    }
}
